package com.ankamagames.dofus.network.types.game.guild.tax
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class TaxCollectorBasicInformations implements INetworkType
   {
      
      public static const protocolId:uint = 96;
       
      
      public var firstNameId:uint = 0;
      
      public var lastNameId:uint = 0;
      
      public var worldX:int = 0;
      
      public var worldY:int = 0;
      
      public var mapId:int = 0;
      
      public function TaxCollectorBasicInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 96;
      }
      
      public function initTaxCollectorBasicInformations(param1:uint = 0, param2:uint = 0, param3:int = 0, param4:int = 0, param5:int = 0) : TaxCollectorBasicInformations
      {
         this.firstNameId = param1;
         this.lastNameId = param2;
         this.worldX = param3;
         this.worldY = param4;
         this.mapId = param5;
         return this;
      }
      
      public function reset() : void
      {
         this.firstNameId = 0;
         this.lastNameId = 0;
         this.worldX = 0;
         this.worldY = 0;
         this.mapId = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_TaxCollectorBasicInformations(param1);
      }
      
      public function serializeAs_TaxCollectorBasicInformations(param1:IDataOutput) : void
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
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element worldX.");
         }
         param1.writeShort(this.worldX);
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element worldY.");
         }
         param1.writeShort(this.worldY);
         param1.writeInt(this.mapId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_TaxCollectorBasicInformations(param1);
      }
      
      public function deserializeAs_TaxCollectorBasicInformations(param1:IDataInput) : void
      {
         this.firstNameId = param1.readShort();
         if(this.firstNameId < 0)
         {
            throw new Error("Forbidden value (" + this.firstNameId + ") on element of TaxCollectorBasicInformations.firstNameId.");
         }
         this.lastNameId = param1.readShort();
         if(this.lastNameId < 0)
         {
            throw new Error("Forbidden value (" + this.lastNameId + ") on element of TaxCollectorBasicInformations.lastNameId.");
         }
         this.worldX = param1.readShort();
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element of TaxCollectorBasicInformations.worldX.");
         }
         this.worldY = param1.readShort();
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element of TaxCollectorBasicInformations.worldY.");
         }
         this.mapId = param1.readInt();
      }
   }
}
