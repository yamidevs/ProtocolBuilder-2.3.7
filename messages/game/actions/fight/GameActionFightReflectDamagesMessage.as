package com.ankamagames.dofus.network.messages.game.actions.fight
{
   import com.ankamagames.dofus.network.messages.game.actions.AbstractGameActionMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameActionFightReflectDamagesMessage extends AbstractGameActionMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5530;
       
      
      private var _isInitialized:Boolean = false;
      
      public var targetId:int = 0;
      
      public var amount:uint = 0;
      
      public function GameActionFightReflectDamagesMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5530;
      }
      
      public function initGameActionFightReflectDamagesMessage(param1:uint = 0, param2:int = 0, param3:int = 0, param4:uint = 0) : GameActionFightReflectDamagesMessage
      {
         super.initAbstractGameActionMessage(param1,param2);
         this.targetId = param3;
         this.amount = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.targetId = 0;
         this.amount = 0;
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
         this.serializeAs_GameActionFightReflectDamagesMessage(param1);
      }
      
      public function serializeAs_GameActionFightReflectDamagesMessage(param1:IDataOutput) : void
      {
         super.serializeAs_AbstractGameActionMessage(param1);
         param1.writeInt(this.targetId);
         if(this.amount < 0)
         {
            throw new Error("Forbidden value (" + this.amount + ") on element amount.");
         }
         param1.writeInt(this.amount);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameActionFightReflectDamagesMessage(param1);
      }
      
      public function deserializeAs_GameActionFightReflectDamagesMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.targetId = param1.readInt();
         this.amount = param1.readInt();
         if(this.amount < 0)
         {
            throw new Error("Forbidden value (" + this.amount + ") on element of GameActionFightReflectDamagesMessage.amount.");
         }
      }
   }
}
