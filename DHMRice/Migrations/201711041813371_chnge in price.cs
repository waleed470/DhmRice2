namespace DHMRice.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class chngeinprice : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Pricings", "PerBagPrice", c => c.Decimal(nullable: false, precision: 18, scale: 2));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Pricings", "PerBagPrice");
        }
    }
}
