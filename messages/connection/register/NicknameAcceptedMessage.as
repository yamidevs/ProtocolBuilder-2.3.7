package com.ankamagames.dofus.network.messages.connection.register
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class NicknameAcceptedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5641;
       
      
      public function NicknameAcceptedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return true;
      }
      
      override public function getMessageId() : uint
      {
         return 5641;
      }
      
      public function initNicknameAcceptedMessage() : NicknameAcceptedMessage
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
      
      public function serializeAs_NicknameAcceptedMessage(param1:IDataOutput) : void
      {
      }
      
      public function deserialize(param1:IDataInput) : void
      {
      }
      
      public function deserializeAs_NicknameAcceptedMessage(param1:IDataInput) : void
      {
      }
   }
}
