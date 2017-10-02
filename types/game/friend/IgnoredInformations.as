package com.ankamagames.dofus.network.types.game.friend
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class IgnoredInformations implements INetworkType
   {
      
      public static const protocolId:uint = 106;
       
      
      public var name:String = "";
      
      public var id:uint = 0;
      
      public function IgnoredInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 106;
      }
      
      public function initIgnoredInformations(param1:String = "", param2:uint = 0) : IgnoredInformations
      {
         this.name = param1;
         this.id = param2;
         return this;
      }
      
      public function reset() : void
      {
         this.name = "";
         this.id = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_IgnoredInformations(param1);
      }
      
      public function serializeAs_IgnoredInformations(param1:IDataOutput) : void
      {
         param1.writeUTF(this.name);
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element id.");
         }
         param1.writeInt(this.id);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_IgnoredInformations(param1);
      }
      
      public function deserializeAs_IgnoredInformations(param1:IDataInput) : void
      {
         this.name = param1.readUTF();
         this.id = param1.readInt();
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element of IgnoredInformations.id.");
         }
      }
   }
}
