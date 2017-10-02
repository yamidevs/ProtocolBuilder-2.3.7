package com.ankamagames.dofus.network.messages.game.interactive.zaap
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ZaapListMessage extends TeleportDestinationsListMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1604;
       
      
      private var _isInitialized:Boolean = false;
      
      public var spawnMapId:uint = 0;
      
      public function ZaapListMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1604;
      }
      
      public function initZaapListMessage(param1:uint = 0, param2:Vector.<uint> = null, param3:Vector.<uint> = null, param4:Vector.<uint> = null, param5:uint = 0) : ZaapListMessage
      {
         super.initTeleportDestinationsListMessage(param1,param2,param3,param4);
         this.spawnMapId = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.spawnMapId = 0;
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
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ZaapListMessage(param1);
      }
      
      public function serializeAs_ZaapListMessage(param1:IDataOutput) : void
      {
         super.serializeAs_TeleportDestinationsListMessage(param1);
         if(this.spawnMapId < 0)
         {
            throw new Error("Forbidden value (" + this.spawnMapId + ") on element spawnMapId.");
         }
         param1.writeInt(this.spawnMapId);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ZaapListMessage(param1);
      }
      
      public function deserializeAs_ZaapListMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.spawnMapId = param1.readInt();
         if(this.spawnMapId < 0)
         {
            throw new Error("Forbidden value (" + this.spawnMapId + ") on element of ZaapListMessage.spawnMapId.");
         }
      }
   }
}
