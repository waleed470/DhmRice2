namespace DHMRice.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class NEWmg : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Transactions",
                c => new
                    {
                        Transaction_id = c.Int(nullable: false, identity: true),
                        Transaction_item_id = c.Int(nullable: false),
                        Transaction_item_type = c.String(),
                        Transaction_Description = c.String(),
                        isBankPayment = c.Boolean(nullable: false),
                        BankAccountNo = c.String(),
                        isCheckPayment = c.Boolean(nullable: false),
                        checkno = c.Int(nullable: false),
                        Debit = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Credit = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Transaction_DateTime = c.DateTime(nullable: false),
                        status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Transaction_id);
            
            AddColumn("dbo.RawRices", "Bags_Sold_qty", c => c.Int(nullable: false));
            AddColumn("dbo.RawRices", "Payed_Amount", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.RawRices", "Remaining_Amount", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.RawRices", "Date", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.RawRices", "Date");
            DropColumn("dbo.RawRices", "Remaining_Amount");
            DropColumn("dbo.RawRices", "Payed_Amount");
            DropColumn("dbo.RawRices", "Bags_Sold_qty");
            DropTable("dbo.Transactions");
        }
    }
}
