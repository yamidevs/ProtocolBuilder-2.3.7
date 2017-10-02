package com.ankamagames.dofus.network.messages.game.actions.fight
{
   import com.ankamagames.dofus.network.messages.game.actions.AbstractGameActionMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameActionFightInvisibleTacklerMessage extends AbstractGameActionMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6233;
       
      
      private var _isInitialized:Boolean = false;
      
      public var extraActionPointLoss:uint = 0;
      
      public var extraMouvementPointLost:uint = 0;
      
      public function GameActionFightInvisibleTacklerMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6233;
      }
      
      public function initGameActionFightInvisibleTacklerMessage(param1:uint = 0, param2:int = 0, param3:uint = 0, param4:uint = 0) : GameActionFightInvisibleTacklerMessage
      {
         super.initAbstractGameActionMessage(param1,param2);
         this.extraActionPointLoss = param3;
         this.extraMouvementPointLost = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.extraActionPointLoss = 0;
         this.extraMouvementPointLost = 0;
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
         this.serializeAs_GameActionFightInvisibleTacklerMessage(param1);
      }
      
      public function serializeAs_GameActionFightInvisibleTacklerMessage(param1:IDataOutput) : void
      {
         super.serializeAs_AbstractGameActionMessage(param1);
         if(this.extraActionPointLoss < 0)
         {
            throw new Error("Forbidden value (" + this.extraActionPointLoss + ") on element extraActionPointLoss.");
         }
         param1.writeInt(this.extraActionPointLoss);
         if(this.extraMouvementPointLost < 0)
         {
            throw new Error("Forbidden value (" + this.extraMouvementPointLost + ") on element extraMouvementPointLost.");
         }
         param1.writeInt(this.extraMouvementPointLost);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameActionFightInvisibleTacklerMessage(param1);
      }
      
      public function deserializeAs_GameActionFightInvisibleTacklerMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.extraActionPointLoss = param1.readInt();
         if(this.extraActionPointLoss < 0)
         {
            throw new Error("Forbidden value (" + this.extraActionPointLoss + ") on element of GameActionFightInvisibleTacklerMessage.extraActionPointLoss.");
         }
         this.extraMouvementPointLost = param1.readInt();
         if(this.extraMouvementPointLost < 0)
         {
            throw new Error("Forbidden value (" + this.extraMouvementPointLost + ") on element of GameActionFightInvisibleTacklerMessage.extraMouvementPointLost.");
         }
      }
   }
}
