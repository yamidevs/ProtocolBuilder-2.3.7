package com.ankamagames.dofus.network.messages.game.context.roleplay.spell
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ValidateSpellForgetMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1700;
       
      
      private var _isInitialized:Boolean = false;
      
      public var spellId:uint = 0;
      
      public function ValidateSpellForgetMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1700;
      }
      
      public function initValidateSpellForgetMessage(param1:uint = 0) : ValidateSpellForgetMessage
      {
         this.spellId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.spellId = 0;
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
         this.serializeAs_ValidateSpellForgetMessage(param1);
      }
      
      public function serializeAs_ValidateSpellForgetMessage(param1:IDataOutput) : void
      {
         if(this.spellId < 0)
         {
            throw new Error("Forbidden value (" + this.spellId + ") on element spellId.");
         }
         param1.writeShort(this.spellId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ValidateSpellForgetMessage(param1);
      }
      
      public function deserializeAs_ValidateSpellForgetMessage(param1:IDataInput) : void
      {
         this.spellId = param1.readShort();
         if(this.spellId < 0)
         {
            throw new Error("Forbidden value (" + this.spellId + ") on element of ValidateSpellForgetMessage.spellId.");
         }
      }
   }
}
