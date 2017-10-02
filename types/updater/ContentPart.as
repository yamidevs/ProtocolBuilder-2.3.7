package com.ankamagames.dofus.network.types.updater
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ContentPart implements INetworkType
   {
      
      public static const protocolId:uint = 350;
       
      
      public var id:String = "";
      
      public var state:uint = 0;
      
      public function ContentPart()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 350;
      }
      
      public function initContentPart(param1:String = "", param2:uint = 0) : ContentPart
      {
         this.id = param1;
         this.state = param2;
         return this;
      }
      
      public function reset() : void
      {
         this.id = "";
         this.state = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ContentPart(param1);
      }
      
      public function serializeAs_ContentPart(param1:IDataOutput) : void
      {
         param1.writeUTF(this.id);
         param1.writeByte(this.state);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ContentPart(param1);
      }
      
      public function deserializeAs_ContentPart(param1:IDataInput) : void
      {
         this.id = param1.readUTF();
         this.state = param1.readByte();
         if(this.state < 0)
         {
            throw new Error("Forbidden value (" + this.state + ") on element of ContentPart.state.");
         }
      }
   }
}
