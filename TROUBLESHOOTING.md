# Troubleshooting

## err_free_prompt_cap (OrcaRouter / Free Tiers)

**Symptom:** 400 error saying prompt is longer than free tier allows.

**Cause:** The combined prompt (rules + memory bank + conversation + file context) exceeds the provider's per-request cap.

**Fix:**
1. Do NOT retry the same request.
2. Run `/newtask` to summarize and reset conversation.
3. Reduce scope: smaller task, fewer files.
4. Check `.clineignore` is excluding build artifacts.
5. If persistent, switch provider (Groq) or add credits.

## Rate Limits (429)

**Symptom:** 429 error.

**Fix:**
1. Wait 60 seconds.
2. Switch to a different free model.
3. Use `/newtask` to reduce context.

## Model Not Responding / Tool Use Fails

**Fix:**
1. Switch to a more capable model.
2. Simplify the task.
3. Check MCP servers are connected.