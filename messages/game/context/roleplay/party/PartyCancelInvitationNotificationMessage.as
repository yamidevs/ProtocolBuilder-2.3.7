package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyCancelInvitationNotificationMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6251;
       
      
      private var _isInitialized:Boolean = false;
      
      public var cancelerId:uint = 0;
      
      public var guestId:uint = 0;
      
      public function PartyCancelInvitationNotificationMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6251;
      }
      
      public function initPartyCancelInvitationNotificationMessage(param1:uint = 0, param2:uint = 0) : PartyCancelInvitationNotificationMessage
      {
         this.cancelerId = param1;
         this.guestId = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.cancelerId = 0;
         this.guestId = 0;
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
         this.serializeAs_PartyCancelInvitationNotificationMessage(param1);
      }
      
      public function serializeAs_PartyCancelInvitationNotificationMessage(param1:IDataOutput) : void
      {
         if(this.cancelerId < 0)
         {
            throw new Error("Forbidden value (" + this.cancelerId + ") on element cancelerId.");
         }
         param1.writeInt(this.cancelerId);
         if(this.guestId < 0)
         {
            throw new Error("Forbidden value (" + this.guestId + ") on element guestId.");
         }
         param1.writeInt(this.guestId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyCancelInvitationNotificationMessage(param1);
      }
      
      public function deserializeAs_PartyCancelInvitationNotificationMessage(param1:IDataInput) : void
      {
         this.cancelerId = param1.readInt();
         if(this.cancelerId < 0)
         {
            throw new Error("Forbidden value (" + this.cancelerId + ") on element of PartyCancelInvitationNotificationMessage.cancelerId.");
         }
         this.guestId = param1.readInt();
         if(this.guestId < 0)
         {
            throw new Error("Forbidden value (" + this.guestId + ") on element of PartyCancelInvitationNotificationMessage.guestId.");
         }
      }
   }
}
