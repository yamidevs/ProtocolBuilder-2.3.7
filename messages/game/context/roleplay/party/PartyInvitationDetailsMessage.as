package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.context.roleplay.party.PartyInvitationMemberInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyInvitationDetailsMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6263;
       
      
      private var _isInitialized:Boolean = false;
      
      public var partyId:uint = 0;
      
      public var fromId:uint = 0;
      
      public var fromName:String = "";
      
      public var leaderId:uint = 0;
      
      public var members:Vector.<PartyInvitationMemberInformations>;
      
      public function PartyInvitationDetailsMessage()
      {
         this.members = new Vector.<PartyInvitationMemberInformations>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6263;
      }
      
      public function initPartyInvitationDetailsMessage(param1:uint = 0, param2:uint = 0, param3:String = "", param4:uint = 0, param5:Vector.<PartyInvitationMemberInformations> = null) : PartyInvitationDetailsMessage
      {
         this.partyId = param1;
         this.fromId = param2;
         this.fromName = param3;
         this.leaderId = param4;
         this.members = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.partyId = 0;
         this.fromId = 0;
         this.fromName = "";
         this.leaderId = 0;
         this.members = new Vector.<PartyInvitationMemberInformations>();
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
         this.serializeAs_PartyInvitationDetailsMessage(param1);
      }
      
      public function serializeAs_PartyInvitationDetailsMessage(param1:IDataOutput) : void
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
         if(this.leaderId < 0)
         {
            throw new Error("Forbidden value (" + this.leaderId + ") on element leaderId.");
         }
         param1.writeInt(this.leaderId);
         param1.writeShort(this.members.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.members.length)
         {
            param1.writeShort((this.members[_loc2_] as PartyInvitationMemberInformations).getTypeId());
            (this.members[_loc2_] as PartyInvitationMemberInformations).serialize(param1);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyInvitationDetailsMessage(param1);
      }
      
      public function deserializeAs_PartyInvitationDetailsMessage(param1:IDataInput) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:PartyInvitationMemberInformations = null;
         this.partyId = param1.readInt();
         if(this.partyId < 0)
         {
            throw new Error("Forbidden value (" + this.partyId + ") on element of PartyInvitationDetailsMessage.partyId.");
         }
         this.fromId = param1.readInt();
         if(this.fromId < 0)
         {
            throw new Error("Forbidden value (" + this.fromId + ") on element of PartyInvitationDetailsMessage.fromId.");
         }
         this.fromName = param1.readUTF();
         this.leaderId = param1.readInt();
         if(this.leaderId < 0)
         {
            throw new Error("Forbidden value (" + this.leaderId + ") on element of PartyInvitationDetailsMessage.leaderId.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readUnsignedShort();
            _loc5_ = ProtocolTypeManager.getInstance(PartyInvitationMemberInformations,_loc4_);
            _loc5_.deserialize(param1);
            this.members.push(_loc5_);
            _loc3_++;
         }
      }
   }
}
