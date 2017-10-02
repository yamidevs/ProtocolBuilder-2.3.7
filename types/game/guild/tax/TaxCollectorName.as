package com.ankamagames.dofus.network.types.game.guild.tax
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class TaxCollectorName implements INetworkType
   {
      
      public static const protocolId:uint = 187;
       
      
      public var firstNameId:uint = 0;
      
      public var lastNameId:uint = 0;
      
      public function TaxCollectorName()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 187;
      }
      
      public function initTaxCollectorName(param1:uint = 0, param2:uint = 0) : TaxCollectorName
      {
         this.firstNameId = param1;
         this.lastNameId = param2;
         return this;
      }
      
      public function reset() : void
      {
         this.firstNameId = 0;
         this.lastNameId = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_TaxCollectorName(param1);
      }
      
      public function serializeAs_TaxCollectorName(param1:IDataOutput) : void
      {
         if(this.firstNameId < 0)
         {
            throw new Error("Forbidden value (" + this.firstNameId + ") on element firstNameId.");
         }
         param1.writeShort(this.firstNameId);
         if(this.lastNameId < 0)
         {
            throw new Error("Forbidden value (" + this.lastNameId + ") on element lastNameId.");
         }
         param1.writeShort(this.lastNameId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_TaxCollectorName(param1);
      }
      
      public function deserializeAs_TaxCollectorName(param1:IDataInput) : void
      {
         this.firstNameId = param1.readShort();
         if(this.firstNameId < 0)
         {
            throw new Error("Forbidden value (" + this.firstNameId + ") on element of TaxCollectorName.firstNameId.");
         }
         this.lastNameId = param1.readShort();
         if(this.lastNameId < 0)
         {
            throw new Error("Forbidden value (" + this.lastNameId + ") on element of TaxCollectorName.lastNameId.");
         }
      }
   }
}
