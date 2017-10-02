package com.ankamagames.dofus.network.types.game.guild.tax
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class TaxCollectorLootInformations implements INetworkType
   {
      
      public static const protocolId:uint = 372;
       
      
      public var kamas:uint = 0;
      
      public var experience:Number = 0;
      
      public var pods:uint = 0;
      
      public var itemsValue:uint = 0;
      
      public function TaxCollectorLootInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 372;
      }
      
      public function initTaxCollectorLootInformations(param1:uint = 0, param2:Number = 0, param3:uint = 0, param4:uint = 0) : TaxCollectorLootInformations
      {
         this.kamas = param1;
         this.experience = param2;
         this.pods = param3;
         this.itemsValue = param4;
         return this;
      }
      
      public function reset() : void
      {
         this.kamas = 0;
         this.experience = 0;
         this.pods = 0;
         this.itemsValue = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_TaxCollectorLootInformations(param1);
      }
      
      public function serializeAs_TaxCollectorLootInformations(param1:IDataOutput) : void
      {
         if(this.kamas < 0)
         {
            throw new Error("Forbidden value (" + this.kamas + ") on element kamas.");
         }
         param1.writeInt(this.kamas);
         if(this.experience < 0)
         {
            throw new Error("Forbidden value (" + this.experience + ") on element experience.");
         }
         param1.writeDouble(this.experience);
         if(this.pods < 0)
         {
            throw new Error("Forbidden value (" + this.pods + ") on element pods.");
         }
         param1.writeInt(this.pods);
         if(this.itemsValue < 0)
         {
            throw new Error("Forbidden value (" + this.itemsValue + ") on element itemsValue.");
         }
         param1.writeInt(this.itemsValue);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_TaxCollectorLootInformations(param1);
      }
      
      public function deserializeAs_TaxCollectorLootInformations(param1:IDataInput) : void
      {
         this.kamas = param1.readInt();
         if(this.kamas < 0)
         {
            throw new Error("Forbidden value (" + this.kamas + ") on element of TaxCollectorLootInformations.kamas.");
         }
         this.experience = param1.readDouble();
         if(this.experience < 0)
         {
            throw new Error("Forbidden value (" + this.experience + ") on element of TaxCollectorLootInformations.experience.");
         }
         this.pods = param1.readInt();
         if(this.pods < 0)
         {
            throw new Error("Forbidden value (" + this.pods + ") on element of TaxCollectorLootInformations.pods.");
         }
         this.itemsValue = param1.readInt();
         if(this.itemsValue < 0)
         {
            throw new Error("Forbidden value (" + this.itemsValue + ") on element of TaxCollectorLootInformations.itemsValue.");
         }
      }
   }
}
