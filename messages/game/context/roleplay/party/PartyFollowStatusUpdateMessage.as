package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyFollowStatusUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5581;
       
      
      private var _isInitialized:Boolean = false;
      
      public var success:Boolean = false;
      
      public var followedId:uint = 0;
      
      public function PartyFollowStatusUpdateMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5581;
      }
      
      public function initPartyFollowStatusUpdateMessage(param1:Boolean = false, param2:uint = 0) : PartyFollowStatusUpdateMessage
      {
         this.success = param1;
         this.followedId = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.success = false;
         this.followedId = 0;
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
         this.serializeAs_PartyFollowStatusUpdateMessage(param1);
      }
      
      public function serializeAs_PartyFollowStatusUpdateMessage(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.success);
         if(this.followedId < 0)
         {
            throw new Error("Forbidden value (" + this.followedId + ") on element followedId.");
         }
         param1.writeInt(this.followedId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyFollowStatusUpdateMessage(param1);
      }
      
      public function deserializeAs_PartyFollowStatusUpdateMessage(param1:IDataInput) : void
      {
         this.success = param1.readBoolean();
         this.followedId = param1.readInt();
         if(this.followedId < 0)
         {
            throw new Error("Forbidden value (" + this.followedId + ") on element of PartyFollowStatusUpdateMessage.followedId.");
         }
      }
   }
}
