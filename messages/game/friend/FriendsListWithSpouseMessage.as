package com.ankamagames.dofus.network.messages.game.friend
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.friend.FriendInformations;
   import com.ankamagames.dofus.network.types.game.friend.FriendSpouseInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class FriendsListWithSpouseMessage extends FriendsListMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5931;
       
      
      private var _isInitialized:Boolean = false;
      
      public var spouse:FriendSpouseInformations;
      
      public function FriendsListWithSpouseMessage()
      {
         this.spouse = new FriendSpouseInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5931;
      }
      
      public function initFriendsListWithSpouseMessage(param1:Vector.<FriendInformations> = null, param2:FriendSpouseInformations = null) : FriendsListWithSpouseMessage
      {
         super.initFriendsListMessage(param1);
         this.spouse = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.spouse = new FriendSpouseInformations();
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
         this.serializeAs_FriendsListWithSpouseMessage(param1);
      }
      
      public function serializeAs_FriendsListWithSpouseMessage(param1:IDataOutput) : void
      {
         super.serializeAs_FriendsListMessage(param1);
         param1.writeShort(this.spouse.getTypeId());
         this.spouse.serialize(param1);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FriendsListWithSpouseMessage(param1);
      }
      
      public function deserializeAs_FriendsListWithSpouseMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         var _loc2_:uint = param1.readUnsignedShort();
         this.spouse = ProtocolTypeManager.getInstance(FriendSpouseInformations,_loc2_);
         this.spouse.deserialize(param1);
      }
   }
}
