package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyInvitationCancelledForGuestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6256;
       
      
      private var _isInitialized:Boolean = false;
      
      public var partyId:uint = 0;
      
      public var cancelerId:uint = 0;
      
      public function PartyInvitationCancelledForGuestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6256;
      }
      
      public function initPartyInvitationCancelledForGuestMessage(param1:uint = 0, param2:uint = 0) : PartyInvitationCancelledForGuestMessage
      {
         this.partyId = param1;
         this.cancelerId = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.partyId = 0;
         this.cancelerId = 0;
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
         this.serializeAs_PartyInvitationCancelledForGuestMessage(param1);
      }
      
      public function serializeAs_PartyInvitationCancelledForGuestMessage(param1:IDataOutput) : void
      {
         if(this.partyId < 0)
         {
            throw new Error("Forbidden value (" + this.partyId + ") on element partyId.");
         }
         param1.writeInt(this.partyId);
         if(this.cancelerId < 0)
         {
            throw new Error("Forbidden value (" + this.cancelerId + ") on element cancelerId.");
         }
         param1.writeInt(this.cancelerId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyInvitationCancelledForGuestMessage(param1);
      }
      
      public function deserializeAs_PartyInvitationCancelledForGuestMessage(param1:IDataInput) : void
      {
         this.partyId = param1.readInt();
         if(this.partyId < 0)
         {
            throw new Error("Forbidden value (" + this.partyId + ") on element of PartyInvitationCancelledForGuestMessage.partyId.");
         }
         this.cancelerId = param1.readInt();
         if(this.cancelerId < 0)
         {
            throw new Error("Forbidden value (" + this.cancelerId + ") on element of PartyInvitationCancelledForGuestMessage.cancelerId.");
         }
      }
   }
}
