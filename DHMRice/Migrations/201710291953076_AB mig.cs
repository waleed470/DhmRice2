namespace DHMRice.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ABmig : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Pricings",
                c => new
                    {
                        Pricing_id = c.Int(nullable: false, identity: true),
                        item_id = c.Int(nullable: false),
                        item_Type = c.String(),
                        Pricing_Rate = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Pricing_Total = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Pricing_NetTotal = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Pricing_Date = c.DateTime(nullable: false),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Pricing_id);
            
            CreateTable(
                "dbo.RawRiceExpenses",
                c => new
                    {
                        RawRiceExpense_id = c.Int(nullable: false, identity: true),
                        RawRiceExpense_Name = c.String(),
                        RawRiceExpense_Amount = c.Decimal(nullable: false, precision: 18, scale: 2),
                        RawRice_id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.RawRiceExpense_id)
                .ForeignKey("dbo.RawRices", t => t.RawRice_id, cascadeDelete: true)
                .Index(t => t.RawRice_id);
            
            AddColumn("dbo.RawRices", "Item_Code", c => c.String(nullable: false));
            DropColumn("dbo.RawRices", "Item_Rice");
        }
        
        public override void Down()
        {
            AddColumn("dbo.RawRices", "Item_Rice", c => c.String(nullable: false));
            DropForeignKey("dbo.RawRiceExpenses", "RawRice_id", "dbo.RawRices");
            DropIndex("dbo.RawRiceExpenses", new[] { "RawRice_id" });
            DropColumn("dbo.RawRices", "Item_Code");
            DropTable("dbo.RawRiceExpenses");
            DropTable("dbo.Pricings");
        }
    }
}
