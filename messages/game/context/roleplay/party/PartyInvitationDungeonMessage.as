package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyInvitationDungeonMessage extends PartyInvitationMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6244;
       
      
      private var _isInitialized:Boolean = false;
      
      public var dungeonId:uint = 0;
      
      public function PartyInvitationDungeonMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6244;
      }
      
      public function initPartyInvitationDungeonMessage(param1:uint = 0, param2:uint = 0, param3:String = "", param4:uint = 0, param5:uint = 0) : PartyInvitationDungeonMessage
      {
         super.initPartyInvitationMessage(param1,param2,param3,param4);
         this.dungeonId = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.dungeonId = 0;
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
         this.serializeAs_PartyInvitationDungeonMessage(param1);
      }
      
      public function serializeAs_PartyInvitationDungeonMessage(param1:IDataOutput) : void
      {
         super.serializeAs_PartyInvitationMessage(param1);
         if(this.dungeonId < 0)
         {
            throw new Error("Forbidden value (" + this.dungeonId + ") on element dungeonId.");
         }
         param1.writeShort(this.dungeonId);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyInvitationDungeonMessage(param1);
      }
      
      public function deserializeAs_PartyInvitationDungeonMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.dungeonId = param1.readShort();
         if(this.dungeonId < 0)
         {
            throw new Error("Forbidden value (" + this.dungeonId + ") on element of PartyInvitationDungeonMessage.dungeonId.");
         }
      }
   }
}
