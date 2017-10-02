package com.ankamagames.dofus.network.messages.game.context.roleplay.quest
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class QuestStepInfoMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5625;
       
      
      private var _isInitialized:Boolean = false;
      
      public var questId:uint = 0;
      
      public var stepId:uint = 0;
      
      public var objectivesIds:Vector.<uint>;
      
      public var objectivesStatus:Vector.<Boolean>;
      
      public function QuestStepInfoMessage()
      {
         this.objectivesIds = new Vector.<uint>();
         this.objectivesStatus = new Vector.<Boolean>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5625;
      }
      
      public function initQuestStepInfoMessage(param1:uint = 0, param2:uint = 0, param3:Vector.<uint> = null, param4:Vector.<Boolean> = null) : QuestStepInfoMessage
      {
         this.questId = param1;
         this.stepId = param2;
         this.objectivesIds = param3;
         this.objectivesStatus = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.questId = 0;
         this.stepId = 0;
         this.objectivesIds = new Vector.<uint>();
         this.objectivesStatus = new Vector.<Boolean>();
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
         this.serializeAs_QuestStepInfoMessage(param1);
      }
      
      public function serializeAs_QuestStepInfoMessage(param1:IDataOutput) : void
      {
         if(this.questId < 0)
         {
            throw new Error("Forbidden value (" + this.questId + ") on element questId.");
         }
         param1.writeShort(this.questId);
         if(this.stepId < 0)
         {
            throw new Error("Forbidden value (" + this.stepId + ") on element stepId.");
         }
         param1.writeShort(this.stepId);
         param1.writeShort(this.objectivesIds.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.objectivesIds.length)
         {
            if(this.objectivesIds[_loc2_] < 0)
            {
               throw new Error("Forbidden value (" + this.objectivesIds[_loc2_] + ") on element 3 (starting at 1) of objectivesIds.");
            }
            param1.writeShort(this.objectivesIds[_loc2_]);
            _loc2_++;
         }
         param1.writeShort(this.objectivesStatus.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.objectivesStatus.length)
         {
            param1.writeBoolean(this.objectivesStatus[_loc3_]);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_QuestStepInfoMessage(param1);
      }
      
      public function deserializeAs_QuestStepInfoMessage(param1:IDataInput) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:Boolean = false;
         this.questId = param1.readShort();
         if(this.questId < 0)
         {
            throw new Error("Forbidden value (" + this.questId + ") on element of QuestStepInfoMessage.questId.");
         }
         this.stepId = param1.readShort();
         if(this.stepId < 0)
         {
            throw new Error("Forbidden value (" + this.stepId + ") on element of QuestStepInfoMessage.stepId.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.readShort();
            if(_loc6_ < 0)
            {
               throw new Error("Forbidden value (" + _loc6_ + ") on elements of objectivesIds.");
            }
            this.objectivesIds.push(_loc6_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = param1.readBoolean();
            this.objectivesStatus.push(_loc7_);
            _loc5_++;
         }
      }
   }
}
