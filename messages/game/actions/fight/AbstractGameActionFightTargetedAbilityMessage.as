package com.ankamagames.dofus.network.messages.game.actions.fight
{
   import com.ankamagames.dofus.network.messages.game.actions.AbstractGameActionMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AbstractGameActionFightTargetedAbilityMessage extends AbstractGameActionMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6118;
       
      
      private var _isInitialized:Boolean = false;
      
      public var destinationCellId:int = 0;
      
      public var critical:uint = 1;
      
      public var silentCast:Boolean = false;
      
      public function AbstractGameActionFightTargetedAbilityMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6118;
      }
      
      public function initAbstractGameActionFightTargetedAbilityMessage(param1:uint = 0, param2:int = 0, param3:int = 0, param4:uint = 1, param5:Boolean = false) : AbstractGameActionFightTargetedAbilityMessage
      {
         super.initAbstractGameActionMessage(param1,param2);
         this.destinationCellId = param3;
         this.critical = param4;
         this.silentCast = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.destinationCellId = 0;
         this.critical = 1;
         this.silentCast = false;
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
         this.serializeAs_AbstractGameActionFightTargetedAbilityMessage(param1);
      }
      
      public function serializeAs_AbstractGameActionFightTargetedAbilityMessage(param1:IDataOutput) : void
      {
         super.serializeAs_AbstractGameActionMessage(param1);
         if(this.destinationCellId < -1 || this.destinationCellId > 559)
         {
            throw new Error("Forbidden value (" + this.destinationCellId + ") on element destinationCellId.");
         }
         param1.writeShort(this.destinationCellId);
         param1.writeByte(this.critical);
         param1.writeBoolean(this.silentCast);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AbstractGameActionFightTargetedAbilityMessage(param1);
      }
      
      public function deserializeAs_AbstractGameActionFightTargetedAbilityMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.destinationCellId = param1.readShort();
         if(this.destinationCellId < -1 || this.destinationCellId > 559)
         {
            throw new Error("Forbidden value (" + this.destinationCellId + ") on element of AbstractGameActionFightTargetedAbilityMessage.destinationCellId.");
         }
         this.critical = param1.readByte();
         if(this.critical < 0)
         {
            throw new Error("Forbidden value (" + this.critical + ") on element of AbstractGameActionFightTargetedAbilityMessage.critical.");
         }
         this.silentCast = param1.readBoolean();
      }
   }
}
