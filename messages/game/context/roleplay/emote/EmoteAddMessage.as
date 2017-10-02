package com.ankamagames.dofus.network.messages.game.context.roleplay.emote
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class EmoteAddMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5644;
       
      
      private var _isInitialized:Boolean = false;
      
      public var emoteId:uint = 0;
      
      public function EmoteAddMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5644;
      }
      
      public function initEmoteAddMessage(param1:uint = 0) : EmoteAddMessage
      {
         this.emoteId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.emoteId = 0;
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
         this.serializeAs_EmoteAddMessage(param1);
      }
      
      public function serializeAs_EmoteAddMessage(param1:IDataOutput) : void
      {
         if(this.emoteId < 0)
         {
            throw new Error("Forbidden value (" + this.emoteId + ") on element emoteId.");
         }
         param1.writeByte(this.emoteId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_EmoteAddMessage(param1);
      }
      
      public function deserializeAs_EmoteAddMessage(param1:IDataInput) : void
      {
         this.emoteId = param1.readByte();
         if(this.emoteId < 0)
         {
            throw new Error("Forbidden value (" + this.emoteId + ") on element of EmoteAddMessage.emoteId.");
         }
      }
   }
}
