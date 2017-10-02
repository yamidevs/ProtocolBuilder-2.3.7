package com.ankamagames.dofus.network.messages.game.friend
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.friend.FriendInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class FriendUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5924;
       
      
      private var _isInitialized:Boolean = false;
      
      public var friendUpdated:FriendInformations;
      
      public function FriendUpdateMessage()
      {
         this.friendUpdated = new FriendInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5924;
      }
      
      public function initFriendUpdateMessage(param1:FriendInformations = null) : FriendUpdateMessage
      {
         this.friendUpdated = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.friendUpdated = new FriendInformations();
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
         this.serializeAs_FriendUpdateMessage(param1);
      }
      
      public function serializeAs_FriendUpdateMessage(param1:IDataOutput) : void
      {
         param1.writeShort(this.friendUpdated.getTypeId());
         this.friendUpdated.serialize(param1);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FriendUpdateMessage(param1);
      }
      
      public function deserializeAs_FriendUpdateMessage(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         this.friendUpdated = ProtocolTypeManager.getInstance(FriendInformations,_loc2_);
         this.friendUpdated.deserialize(param1);
      }
   }
}
