package com.ankamagames.dofus.network.messages.game.actions.fight
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameActionFightNoSpellCastMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6132;
       
      
      private var _isInitialized:Boolean = false;
      
      public var spellLevelId:uint = 0;
      
      public function GameActionFightNoSpellCastMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6132;
      }
      
      public function initGameActionFightNoSpellCastMessage(param1:uint = 0) : GameActionFightNoSpellCastMessage
      {
         this.spellLevelId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.spellLevelId = 0;
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
         this.serializeAs_GameActionFightNoSpellCastMessage(param1);
      }
      
      public function serializeAs_GameActionFightNoSpellCastMessage(param1:IDataOutput) : void
      {
         if(this.spellLevelId < 0)
         {
            throw new Error("Forbidden value (" + this.spellLevelId + ") on element spellLevelId.");
         }
         param1.writeInt(this.spellLevelId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameActionFightNoSpellCastMessage(param1);
      }
      
      public function deserializeAs_GameActionFightNoSpellCastMessage(param1:IDataInput) : void
      {
         this.spellLevelId = param1.readInt();
         if(this.spellLevelId < 0)
         {
            throw new Error("Forbidden value (" + this.spellLevelId + ") on element of GameActionFightNoSpellCastMessage.spellLevelId.");
         }
      }
   }
}
