package com.ankamagames.dofus.network.messages.game.startup
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class StartupActionsExecuteMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1302;
       
      
      public function StartupActionsExecuteMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return true;
      }
      
      override public function getMessageId() : uint
      {
         return 1302;
      }
      
      public function initStartupActionsExecuteMessage() : StartupActionsExecuteMessage
      {
         return this;
      }
      
      override public function reset() : void
      {
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
      }
      
      public function serializeAs_StartupActionsExecuteMessage(param1:IDataOutput) : void
      {
      }
      
      public function deserialize(param1:IDataInput) : void
      {
      }
      
      public function deserializeAs_StartupActionsExecuteMessage(param1:IDataInput) : void
      {
      }
   }
}
