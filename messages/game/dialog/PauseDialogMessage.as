package com.ankamagames.dofus.network.messages.game.dialog
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PauseDialogMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6012;
       
      
      public function PauseDialogMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return true;
      }
      
      override public function getMessageId() : uint
      {
         return 6012;
      }
      
      public function initPauseDialogMessage() : PauseDialogMessage
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
      
      public function serializeAs_PauseDialogMessage(param1:IDataOutput) : void
      {
      }
      
      public function deserialize(param1:IDataInput) : void
      {
      }
      
      public function deserializeAs_PauseDialogMessage(param1:IDataInput) : void
      {
      }
   }
}
