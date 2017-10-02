package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyInvitationMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5586;
       
      
      private var _isInitialized:Boolean = false;
      
      public var partyId:uint = 0;
      
      public var fromId:uint = 0;
      
      public var fromName:String = "";
      
      public var toId:uint = 0;
      
      public function PartyInvitationMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5586;
      }
      
      public function initPartyInvitationMessage(param1:uint = 0, param2:uint = 0, param3:String = "", param4:uint = 0) : PartyInvitationMessage
      {
         this.partyId = param1;
         this.fromId = param2;
         this.fromName = param3;
         this.toId = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.partyId = 0;
         this.fromId = 0;
         this.fromName = "";
         this.toId = 0;
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
         this.serializeAs_PartyInvitationMessage(param1);
      }
      
      public function serializeAs_PartyInvitationMessage(param1:IDataOutput) : void
      {
         if(this.partyId < 0)
         {
            throw new Error("Forbidden value (" + this.partyId + ") on element partyId.");
         }
         param1.writeInt(this.partyId);
         if(this.fromId < 0)
         {
            throw new Error("Forbidden value (" + this.fromId + ") on element fromId.");
         }
         param1.writeInt(this.fromId);
         param1.writeUTF(this.fromName);
         if(this.toId < 0)
         {
            throw new Error("Forbidden value (" + this.toId + ") on element toId.");
         }
         param1.writeInt(this.toId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyInvitationMessage(param1);
      }
      
      public function deserializeAs_PartyInvitationMessage(param1:IDataInput) : void
      {
         this.partyId = param1.readInt();
         if(this.partyId < 0)
         {
            throw new Error("Forbidden value (" + this.partyId + ") on element of PartyInvitationMessage.partyId.");
         }
         this.fromId = param1.readInt();
         if(this.fromId < 0)
         {
            throw new Error("Forbidden value (" + this.fromId + ") on element of PartyInvitationMessage.fromId.");
         }
         this.fromName = param1.readUTF();
         this.toId = param1.readInt();
         if(this.toId < 0)
         {
            throw new Error("Forbidden value (" + this.toId + ") on element of PartyInvitationMessage.toId.");
         }
      }
   }
}
