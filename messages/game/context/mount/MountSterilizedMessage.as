package com.ankamagames.dofus.network.messages.game.context.mount
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class MountSterilizedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5977;
       
      
      private var _isInitialized:Boolean = false;
      
      public var mountId:Number = 0;
      
      public function MountSterilizedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5977;
      }
      
      public function initMountSterilizedMessage(param1:Number = 0) : MountSterilizedMessage
      {
         this.mountId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.mountId = 0;
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
         this.serializeAs_MountSterilizedMessage(param1);
      }
      
      public function serializeAs_MountSterilizedMessage(param1:IDataOutput) : void
      {
         param1.writeDouble(this.mountId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_MountSterilizedMessage(param1);
      }
      
      public function deserializeAs_MountSterilizedMessage(param1:IDataInput) : void
      {
         this.mountId = param1.readDouble();
      }
   }
}
