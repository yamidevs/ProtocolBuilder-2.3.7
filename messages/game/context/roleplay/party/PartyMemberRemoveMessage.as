package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyMemberRemoveMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5579;
       
      
      private var _isInitialized:Boolean = false;
      
      public var leavingPlayerId:uint = 0;
      
      public function PartyMemberRemoveMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5579;
      }
      
      public function initPartyMemberRemoveMessage(param1:uint = 0) : PartyMemberRemoveMessage
      {
         this.leavingPlayerId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.leavingPlayerId = 0;
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
         this.serializeAs_PartyMemberRemoveMessage(param1);
      }
      
      public function serializeAs_PartyMemberRemoveMessage(param1:IDataOutput) : void
      {
         if(this.leavingPlayerId < 0)
         {
            throw new Error("Forbidden value (" + this.leavingPlayerId + ") on element leavingPlayerId.");
         }
         param1.writeInt(this.leavingPlayerId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyMemberRemoveMessage(param1);
      }
      
      public function deserializeAs_PartyMemberRemoveMessage(param1:IDataInput) : void
      {
         this.leavingPlayerId = param1.readInt();
         if(this.leavingPlayerId < 0)
         {
            throw new Error("Forbidden value (" + this.leavingPlayerId + ") on element of PartyMemberRemoveMessage.leavingPlayerId.");
         }
      }
   }
}
