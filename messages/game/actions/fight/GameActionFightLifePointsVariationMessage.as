package com.ankamagames.dofus.network.messages.game.actions.fight
{
   import com.ankamagames.dofus.network.messages.game.actions.AbstractGameActionMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameActionFightLifePointsVariationMessage extends AbstractGameActionMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5598;
       
      
      private var _isInitialized:Boolean = false;
      
      public var targetId:int = 0;
      
      public var delta:int = 0;
      
      public function GameActionFightLifePointsVariationMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5598;
      }
      
      public function initGameActionFightLifePointsVariationMessage(param1:uint = 0, param2:int = 0, param3:int = 0, param4:int = 0) : GameActionFightLifePointsVariationMessage
      {
         super.initAbstractGameActionMessage(param1,param2);
         this.targetId = param3;
         this.delta = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.targetId = 0;
         this.delta = 0;
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
         this.serializeAs_GameActionFightLifePointsVariationMessage(param1);
      }
      
      public function serializeAs_GameActionFightLifePointsVariationMessage(param1:IDataOutput) : void
      {
         super.serializeAs_AbstractGameActionMessage(param1);
         param1.writeInt(this.targetId);
         param1.writeShort(this.delta);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameActionFightLifePointsVariationMessage(param1);
      }
      
      public function deserializeAs_GameActionFightLifePointsVariationMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.targetId = param1.readInt();
         this.delta = param1.readShort();
      }
   }
}
