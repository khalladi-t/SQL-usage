ALTER TABLE dbo.<name>
ADD InvoiceExternalIdPrefix AS LEFT(InvoiceExternalId, 2) PERSISTED
