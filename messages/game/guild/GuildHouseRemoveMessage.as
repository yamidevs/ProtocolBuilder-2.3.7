package com.ankamagames.dofus.network.messages.game.guild
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GuildHouseRemoveMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6180;
       
      
      private var _isInitialized:Boolean = false;
      
      public var houseId:uint = 0;
      
      public function GuildHouseRemoveMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6180;
      }
      
      public function initGuildHouseRemoveMessage(param1:uint = 0) : GuildHouseRemoveMessage
      {
         this.houseId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.houseId = 0;
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
         this.serializeAs_GuildHouseRemoveMessage(param1);
      }
      
      public function serializeAs_GuildHouseRemoveMessage(param1:IDataOutput) : void
      {
         if(this.houseId < 0)
         {
            throw new Error("Forbidden value (" + this.houseId + ") on element houseId.");
         }
         param1.writeInt(this.houseId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GuildHouseRemoveMessage(param1);
      }
      
      public function deserializeAs_GuildHouseRemoveMessage(param1:IDataInput) : void
      {
         this.houseId = param1.readInt();
         if(this.houseId < 0)
         {
            throw new Error("Forbidden value (" + this.houseId + ") on element of GuildHouseRemoveMessage.houseId.");
         }
      }
   }
}
