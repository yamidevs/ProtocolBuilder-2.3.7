package com.ankamagames.dofus.network.messages.game.context.roleplay.spell
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class SpellForgottenMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5834;
       
      
      private var _isInitialized:Boolean = false;
      
      public var spellsId:Vector.<uint>;
      
      public var boostPoint:uint = 0;
      
      public function SpellForgottenMessage()
      {
         this.spellsId = new Vector.<uint>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5834;
      }
      
      public function initSpellForgottenMessage(param1:Vector.<uint> = null, param2:uint = 0) : SpellForgottenMessage
      {
         this.spellsId = param1;
         this.boostPoint = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.spellsId = new Vector.<uint>();
         this.boostPoint = 0;
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
         this.serializeAs_SpellForgottenMessage(param1);
      }
      
      public function serializeAs_SpellForgottenMessage(param1:IDataOutput) : void
      {
         param1.writeShort(this.spellsId.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.spellsId.length)
         {
            if(this.spellsId[_loc2_] < 0)
            {
               throw new Error("Forbidden value (" + this.spellsId[_loc2_] + ") on element 1 (starting at 1) of spellsId.");
            }
            param1.writeShort(this.spellsId[_loc2_]);
            _loc2_++;
         }
         if(this.boostPoint < 0)
         {
            throw new Error("Forbidden value (" + this.boostPoint + ") on element boostPoint.");
         }
         param1.writeShort(this.boostPoint);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_SpellForgottenMessage(param1);
      }
      
      public function deserializeAs_SpellForgottenMessage(param1:IDataInput) : void
      {
         var _loc4_:uint = 0;
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readShort();
            if(_loc4_ < 0)
            {
               throw new Error("Forbidden value (" + _loc4_ + ") on elements of spellsId.");
            }
            this.spellsId.push(_loc4_);
            _loc3_++;
         }
         this.boostPoint = param1.readShort();
         if(this.boostPoint < 0)
         {
            throw new Error("Forbidden value (" + this.boostPoint + ") on element of SpellForgottenMessage.boostPoint.");
         }
      }
   }
}
