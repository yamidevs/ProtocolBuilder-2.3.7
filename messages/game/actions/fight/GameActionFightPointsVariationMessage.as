package com.ankamagames.dofus.network.messages.game.actions.fight
{
   import com.ankamagames.dofus.network.messages.game.actions.AbstractGameActionMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameActionFightPointsVariationMessage extends AbstractGameActionMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1030;
       
      
      private var _isInitialized:Boolean = false;
      
      public var targetId:int = 0;
      
      public var delta:int = 0;
      
      public function GameActionFightPointsVariationMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1030;
      }
      
      public function initGameActionFightPointsVariationMessage(param1:uint = 0, param2:int = 0, param3:int = 0, param4:int = 0) : GameActionFightPointsVariationMessage
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
         this.serializeAs_GameActionFightPointsVariationMessage(param1);
      }
      
      public function serializeAs_GameActionFightPointsVariationMessage(param1:IDataOutput) : void
      {
         super.serializeAs_AbstractGameActionMessage(param1);
         param1.writeInt(this.targetId);
         param1.writeShort(this.delta);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameActionFightPointsVariationMessage(param1);
      }
      
      public function deserializeAs_GameActionFightPointsVariationMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.targetId = param1.readInt();
         this.delta = param1.readShort();
      }
   }
}
