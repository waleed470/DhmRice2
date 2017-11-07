namespace DHMRice.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Newmig : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Opening_ClosingDays",
                c => new
                    {
                        Opening_ClosingDays_id = c.Int(nullable: false, identity: true),
                        Opening_Balance = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Closing_Balance = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Date = c.DateTime(nullable: false),
                        isClosed = c.Boolean(nullable: false),
                        status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Opening_ClosingDays_id);
            
            AddColumn("dbo.Transactions", "Opening_ClosingDays_id", c => c.Int(nullable: false));
            CreateIndex("dbo.Transactions", "Opening_ClosingDays_id");
            AddForeignKey("dbo.Transactions", "Opening_ClosingDays_id", "dbo.Opening_ClosingDays", "Opening_ClosingDays_id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Transactions", "Opening_ClosingDays_id", "dbo.Opening_ClosingDays");
            DropIndex("dbo.Transactions", new[] { "Opening_ClosingDays_id" });
            DropColumn("dbo.Transactions", "Opening_ClosingDays_id");
            DropTable("dbo.Opening_ClosingDays");
        }
    }
}
