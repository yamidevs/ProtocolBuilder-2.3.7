package com.ankamagames.dofus.network.messages.game.inventory.preset
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class InventoryPresetDeleteMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6169;
       
      
      private var _isInitialized:Boolean = false;
      
      public var presetId:uint = 0;
      
      public function InventoryPresetDeleteMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6169;
      }
      
      public function initInventoryPresetDeleteMessage(param1:uint = 0) : InventoryPresetDeleteMessage
      {
         this.presetId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.presetId = 0;
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
         this.serializeAs_InventoryPresetDeleteMessage(param1);
      }
      
      public function serializeAs_InventoryPresetDeleteMessage(param1:IDataOutput) : void
      {
         if(this.presetId < 0)
         {
            throw new Error("Forbidden value (" + this.presetId + ") on element presetId.");
         }
         param1.writeByte(this.presetId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_InventoryPresetDeleteMessage(param1);
      }
      
      public function deserializeAs_InventoryPresetDeleteMessage(param1:IDataInput) : void
      {
         this.presetId = param1.readByte();
         if(this.presetId < 0)
         {
            throw new Error("Forbidden value (" + this.presetId + ") on element of InventoryPresetDeleteMessage.presetId.");
         }
      }
   }
}
