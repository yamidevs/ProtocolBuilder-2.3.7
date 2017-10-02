package com.ankamagames.dofus.network.types.game.guild.tax
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class AdditionalTaxCollectorInformations implements INetworkType
   {
      
      public static const protocolId:uint = 165;
       
      
      public var CollectorCallerName:String = "";
      
      public var date:uint = 0;
      
      public function AdditionalTaxCollectorInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 165;
      }
      
      public function initAdditionalTaxCollectorInformations(param1:String = "", param2:uint = 0) : AdditionalTaxCollectorInformations
      {
         this.CollectorCallerName = param1;
         this.date = param2;
         return this;
      }
      
      public function reset() : void
      {
         this.CollectorCallerName = "";
         this.date = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_AdditionalTaxCollectorInformations(param1);
      }
      
      public function serializeAs_AdditionalTaxCollectorInformations(param1:IDataOutput) : void
      {
         param1.writeUTF(this.CollectorCallerName);
         if(this.date < 0)
         {
            throw new Error("Forbidden value (" + this.date + ") on element date.");
         }
         param1.writeInt(this.date);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AdditionalTaxCollectorInformations(param1);
      }
      
      public function deserializeAs_AdditionalTaxCollectorInformations(param1:IDataInput) : void
      {
         this.CollectorCallerName = param1.readUTF();
         this.date = param1.readInt();
         if(this.date < 0)
         {
            throw new Error("Forbidden value (" + this.date + ") on element of AdditionalTaxCollectorInformations.date.");
         }
      }
   }
}
