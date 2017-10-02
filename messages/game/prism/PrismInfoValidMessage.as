package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.dofus.network.types.game.fight.ProtectedEntityWaitingForHelpInfo;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismInfoValidMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5858;
       
      
      private var _isInitialized:Boolean = false;
      
      public var waitingForHelpInfo:ProtectedEntityWaitingForHelpInfo;
      
      public function PrismInfoValidMessage()
      {
         this.waitingForHelpInfo = new ProtectedEntityWaitingForHelpInfo();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5858;
      }
      
      public function initPrismInfoValidMessage(param1:ProtectedEntityWaitingForHelpInfo = null) : PrismInfoValidMessage
      {
         this.waitingForHelpInfo = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.waitingForHelpInfo = new ProtectedEntityWaitingForHelpInfo();
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
         this.serializeAs_PrismInfoValidMessage(param1);
      }
      
      public function serializeAs_PrismInfoValidMessage(param1:IDataOutput) : void
      {
         this.waitingForHelpInfo.serializeAs_ProtectedEntityWaitingForHelpInfo(param1);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismInfoValidMessage(param1);
      }
      
      public function deserializeAs_PrismInfoValidMessage(param1:IDataInput) : void
      {
         this.waitingForHelpInfo = new ProtectedEntityWaitingForHelpInfo();
         this.waitingForHelpInfo.deserialize(param1);
      }
   }
}
