namespace DHMRice.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Rice_Productions : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Rice_Production",
                c => new
                    {
                        Rice_Production_id = c.Int(nullable: false, identity: true),
                        Rice_Production_name = c.String(),
                        Packing_Id = c.Int(nullable: false),
                        Rice_Production_TotalRate = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Rice_Production_TotalBags = c.Int(nullable: false),
                        Rice_Production_Bags = c.Int(nullable: false),
                        Rice_Production_TotalWieght = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Rice_Production_Average = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Rice_Production_TotalWorth = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Rice_Production_ShortFall_total = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Rice_Production_TotalExpense = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Rice_Production_StockWorth = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Rice_Production_TotalByProductWorth = c.Decimal(nullable: false, precision: 18, scale: 2),
                        FactoryCost = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Rice_Production_perBagPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                        MarketPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.Rice_Production_id)
                .ForeignKey("dbo.Packings", t => t.Packing_Id, cascadeDelete: true)
                .Index(t => t.Packing_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Rice_Production", "Packing_Id", "dbo.Packings");
            DropIndex("dbo.Rice_Production", new[] { "Packing_Id" });
            DropTable("dbo.Rice_Production");
        }
    }
}
