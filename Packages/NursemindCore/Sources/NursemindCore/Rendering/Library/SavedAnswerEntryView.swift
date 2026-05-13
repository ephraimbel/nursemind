import SwiftUI
import SwiftData

/// Detail view for a saved AI answer. Reuses MessageBodyView + ReferencesSection
/// so the visual fidelity of the answer is identical to how it looked in chat.
/// Toolbar: rename, delete, share.
public struct SavedAnswerEntryView: View {
    private let answer: SavedAnswer
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var showRenameAlert = false
    @State private var showDeleteAlert = false
    @State private var renameText = ""
    @State private var showShareSheet = false

    public init(_ answer: SavedAnswer) {
        self.answer = answer
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                Hairline().padding(.vertical, NMSpace.xxl)
                MessageBodyView(content: answer.answerMarkdown, citations: answer.citations)
                if !answer.citations.isEmpty {
                    Divider().padding(.vertical, NMSpace.lg)
                    ReferencesSection(citations: answer.citations)
                }
                Spacer().frame(height: NMSpace.xxl)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.xxl)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button {
                        renameText = answer.customTitle ?? ""
                        showRenameAlert = true
                    } label: {
                        Label("Rename", systemImage: "pencil")
                    }
                    Button {
                        showShareSheet = true
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    Divider()
                    Button(role: .destructive) {
                        showDeleteAlert = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .foregroundStyle(NMColor.textPrimary)
                }
                .accessibilityLabel("Saved answer options")
            }
        }
        .alert("Rename answer", isPresented: $showRenameAlert) {
            TextField("Custom title", text: $renameText)
            Button("Cancel", role: .cancel) {}
            Button("Save") {
                let trimmed = renameText.trimmingCharacters(in: .whitespacesAndNewlines)
                answer.customTitle = trimmed.isEmpty ? nil : trimmed
                try? modelContext.save()
                SavedAnswerSyncService.shared.didInsertOrUpdate(answer)
            }
        } message: {
            Text("Choose how this saved answer appears in your library.")
        }
        .alert("Delete this saved answer?", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                let removedID = answer.id
                modelContext.delete(answer)
                try? modelContext.save()
                SavedAnswerSyncService.shared.didDelete(id: removedID)
                dismiss()
            }
        } message: {
            Text("This can't be undone.")
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(text: shareableText)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("SAVED · \(savedAtLabel)", sparkle: false)
            Text(answer.displayTitle)
                .font(NMFont.displayMD)
                .tracking(-0.4)
                .foregroundStyle(NMColor.textPrimary)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            if let custom = answer.customTitle, !custom.isEmpty, custom != answer.question {
                Text(answer.question)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    /// Eyebrow date label — shows relative date for recent saves ("2 DAYS AGO"),
    /// falls back to formal date for anything older than a week ("MAY 4, 2026").
    private var savedAtLabel: String {
        let interval = Date().timeIntervalSince(answer.savedAt)
        let oneWeek: TimeInterval = 7 * 24 * 3600
        if interval < oneWeek {
            let f = RelativeDateTimeFormatter()
            f.unitsStyle = .full
            return f.localizedString(for: answer.savedAt, relativeTo: Date()).uppercased()
        }
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .none
        return f.string(from: answer.savedAt).uppercased()
    }

    private var shareableText: String {
        var text = "Q: \(answer.question)\n\n"
        text += answer.answerMarkdown
        if !answer.citations.isEmpty {
            text += "\n\nSources:\n"
            for (i, source) in answer.citations.enumerated() {
                text += "\(i+1). \(source.shortName)\n   \(source.url)\n"
            }
        }
        text += "\n\nReference only — always follow your facility's policies and verify with your provider."
        return text
    }
}

private struct ShareSheet: UIViewControllerRepresentable {
    let text: String

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: [text], applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
