package com.ankamagames.dofus.network.messages.game.guild.tax
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.guild.tax.TaxCollectorFightersInformation;
   import com.ankamagames.dofus.network.types.game.guild.tax.TaxCollectorInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class TaxCollectorListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5930;
       
      
      private var _isInitialized:Boolean = false;
      
      public var nbcollectorMax:uint = 0;
      
      public var taxCollectorHireCost:uint = 0;
      
      public var informations:Vector.<TaxCollectorInformations>;
      
      public var fightersInformations:Vector.<TaxCollectorFightersInformation>;
      
      public function TaxCollectorListMessage()
      {
         this.informations = new Vector.<TaxCollectorInformations>();
         this.fightersInformations = new Vector.<TaxCollectorFightersInformation>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5930;
      }
      
      public function initTaxCollectorListMessage(param1:uint = 0, param2:uint = 0, param3:Vector.<TaxCollectorInformations> = null, param4:Vector.<TaxCollectorFightersInformation> = null) : TaxCollectorListMessage
      {
         this.nbcollectorMax = param1;
         this.taxCollectorHireCost = param2;
         this.informations = param3;
         this.fightersInformations = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.nbcollectorMax = 0;
         this.taxCollectorHireCost = 0;
         this.informations = new Vector.<TaxCollectorInformations>();
         this.fightersInformations = new Vector.<TaxCollectorFightersInformation>();
         this._isInitialized = false;
      }
      
      override public function pack(param1:IDataOutput) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(_loc2_);
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:IDataInput, param2:uint) : void
      {
         this.deserialize(param1);
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_TaxCollectorListMessage(param1);
      }
      
      public function serializeAs_TaxCollectorListMessage(param1:IDataOutput) : void
      {
         if(this.nbcollectorMax < 0)
         {
            throw new Error("Forbidden value (" + this.nbcollectorMax + ") on element nbcollectorMax.");
         }
         param1.writeByte(this.nbcollectorMax);
         if(this.taxCollectorHireCost < 0)
         {
            throw new Error("Forbidden value (" + this.taxCollectorHireCost + ") on element taxCollectorHireCost.");
         }
         param1.writeShort(this.taxCollectorHireCost);
         param1.writeShort(this.informations.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.informations.length)
         {
            param1.writeShort((this.informations[_loc2_] as TaxCollectorInformations).getTypeId());
            (this.informations[_loc2_] as TaxCollectorInformations).serialize(param1);
            _loc2_++;
         }
         param1.writeShort(this.fightersInformations.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.fightersInformations.length)
         {
            (this.fightersInformations[_loc3_] as TaxCollectorFightersInformation).serializeAs_TaxCollectorFightersInformation(param1);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_TaxCollectorListMessage(param1);
      }
      
      public function deserializeAs_TaxCollectorListMessage(param1:IDataInput) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:TaxCollectorInformations = null;
         var _loc8_:TaxCollectorFightersInformation = null;
         this.nbcollectorMax = param1.readByte();
         if(this.nbcollectorMax < 0)
         {
            throw new Error("Forbidden value (" + this.nbcollectorMax + ") on element of TaxCollectorListMessage.nbcollectorMax.");
         }
         this.taxCollectorHireCost = param1.readShort();
         if(this.taxCollectorHireCost < 0)
         {
            throw new Error("Forbidden value (" + this.taxCollectorHireCost + ") on element of TaxCollectorListMessage.taxCollectorHireCost.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.readUnsignedShort();
            _loc7_ = ProtocolTypeManager.getInstance(TaxCollectorInformations,_loc6_);
            _loc7_.deserialize(param1);
            this.informations.push(_loc7_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = new TaxCollectorFightersInformation();
            _loc8_.deserialize(param1);
            this.fightersInformations.push(_loc8_);
            _loc5_++;
         }
      }
   }
}
