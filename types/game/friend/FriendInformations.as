package com.ankamagames.dofus.network.types.game.friend
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class FriendInformations implements INetworkType
   {
      
      public static const protocolId:uint = 78;
       
      
      public var name:String = "";
      
      public var playerState:uint = 99;
      
      public var lastConnection:uint = 0;
      
      public function FriendInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 78;
      }
      
      public function initFriendInformations(param1:String = "", param2:uint = 99, param3:uint = 0) : FriendInformations
      {
         this.name = param1;
         this.playerState = param2;
         this.lastConnection = param3;
         return this;
      }
      
      public function reset() : void
      {
         this.name = "";
         this.playerState = 99;
         this.lastConnection = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_FriendInformations(param1);
      }
      
      public function serializeAs_FriendInformations(param1:IDataOutput) : void
      {
         param1.writeUTF(this.name);
         param1.writeByte(this.playerState);
         if(this.lastConnection < 0)
         {
            throw new Error("Forbidden value (" + this.lastConnection + ") on element lastConnection.");
         }
         param1.writeInt(this.lastConnection);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FriendInformations(param1);
      }
      
      public function deserializeAs_FriendInformations(param1:IDataInput) : void
      {
         this.name = param1.readUTF();
         this.playerState = param1.readByte();
         if(this.playerState < 0)
         {
            throw new Error("Forbidden value (" + this.playerState + ") on element of FriendInformations.playerState.");
         }
         this.lastConnection = param1.readInt();
         if(this.lastConnection < 0)
         {
            throw new Error("Forbidden value (" + this.lastConnection + ") on element of FriendInformations.lastConnection.");
         }
      }
   }
}
