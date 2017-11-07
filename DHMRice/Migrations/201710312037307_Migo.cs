namespace DHMRice.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Migo : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.RawRices", "Payed_Amount");
            DropColumn("dbo.RawRices", "Remaining_Amount");
        }
        
        public override void Down()
        {
            AddColumn("dbo.RawRices", "Remaining_Amount", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.RawRices", "Payed_Amount", c => c.Decimal(nullable: false, precision: 18, scale: 2));
        }
    }
}
