namespace DHMRice.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Migo1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Transactions", "isByCash", c => c.Boolean(nullable: false));
            DropColumn("dbo.Transactions", "isBankPayment");
            DropColumn("dbo.Transactions", "isCheckPayment");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Transactions", "isCheckPayment", c => c.Boolean(nullable: false));
            AddColumn("dbo.Transactions", "isBankPayment", c => c.Boolean(nullable: false));
            DropColumn("dbo.Transactions", "isByCash");
        }
    }
}
