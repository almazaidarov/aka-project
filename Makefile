.PHONY: clean clean-all

# Remove Terraform cache (providers, modules)
clean:
	@echo "🧹 Cleaning Terraform cache..."
	rm -rf .terraform
	rm -f .terraform.lock.hcl
	@echo "✅ Terraform cache cleaned"

# Deep clean (Terraform cache + state backups)
clean-all:
	@echo "🔥 Deep cleaning Terraform files..."
	rm -rf .terraform
	rm -f .terraform.lock.hcl
	rm -f terraform.tfstate.backup
	@echo "✅ Deep clean completed"
