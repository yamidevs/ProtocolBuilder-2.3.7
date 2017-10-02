package com.ankamagames.dofus.network.messages.game.friend
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class FriendAddFailureMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5600;
       
      
      private var _isInitialized:Boolean = false;
      
      public var reason:uint = 0;
      
      public function FriendAddFailureMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5600;
      }
      
      public function initFriendAddFailureMessage(param1:uint = 0) : FriendAddFailureMessage
      {
         this.reason = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.reason = 0;
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
         this.serializeAs_FriendAddFailureMessage(param1);
      }
      
      public function serializeAs_FriendAddFailureMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.reason);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FriendAddFailureMessage(param1);
      }
      
      public function deserializeAs_FriendAddFailureMessage(param1:IDataInput) : void
      {
         this.reason = param1.readByte();
         if(this.reason < 0)
         {
            throw new Error("Forbidden value (" + this.reason + ") on element of FriendAddFailureMessage.reason.");
         }
      }
   }
}
