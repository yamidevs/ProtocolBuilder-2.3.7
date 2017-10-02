package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyCannotJoinErrorMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5583;
       
      
      private var _isInitialized:Boolean = false;
      
      public var reason:uint = 0;
      
      public function PartyCannotJoinErrorMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5583;
      }
      
      public function initPartyCannotJoinErrorMessage(param1:uint = 0) : PartyCannotJoinErrorMessage
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
         this.serializeAs_PartyCannotJoinErrorMessage(param1);
      }
      
      public function serializeAs_PartyCannotJoinErrorMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.reason);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyCannotJoinErrorMessage(param1);
      }
      
      public function deserializeAs_PartyCannotJoinErrorMessage(param1:IDataInput) : void
      {
         this.reason = param1.readByte();
         if(this.reason < 0)
         {
            throw new Error("Forbidden value (" + this.reason + ") on element of PartyCannotJoinErrorMessage.reason.");
         }
      }
   }
}
