package com.ankamagames.dofus.network.types.game.paddock
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class PaddockContentInformations extends PaddockInformations implements INetworkType
   {
      
      public static const protocolId:uint = 183;
       
      
      public var paddockId:int = 0;
      
      public var worldX:int = 0;
      
      public var worldY:int = 0;
      
      public var mapId:int = 0;
      
      public var mountsInformations:Vector.<MountInformationsForPaddock>;
      
      public function PaddockContentInformations()
      {
         this.mountsInformations = new Vector.<MountInformationsForPaddock>();
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 183;
      }
      
      public function initPaddockContentInformations(param1:uint = 0, param2:uint = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0, param7:Vector.<MountInformationsForPaddock> = null) : PaddockContentInformations
      {
         super.initPaddockInformations(param1,param2);
         this.paddockId = param3;
         this.worldX = param4;
         this.worldY = param5;
         this.mapId = param6;
         this.mountsInformations = param7;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.paddockId = 0;
         this.worldX = 0;
         this.worldY = 0;
         this.mapId = 0;
         this.mountsInformations = new Vector.<MountInformationsForPaddock>();
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_PaddockContentInformations(param1);
      }
      
      public function serializeAs_PaddockContentInformations(param1:IDataOutput) : void
      {
         super.serializeAs_PaddockInformations(param1);
         param1.writeInt(this.paddockId);
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element worldX.");
         }
         param1.writeShort(this.worldX);
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element worldY.");
         }
         param1.writeShort(this.worldY);
         param1.writeInt(this.mapId);
         param1.writeShort(this.mountsInformations.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.mountsInformations.length)
         {
            (this.mountsInformations[_loc2_] as MountInformationsForPaddock).serializeAs_MountInformationsForPaddock(param1);
            _loc2_++;
         }
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PaddockContentInformations(param1);
      }
      
      public function deserializeAs_PaddockContentInformations(param1:IDataInput) : void
      {
         var _loc4_:MountInformationsForPaddock = null;
         super.deserialize(param1);
         this.paddockId = param1.readInt();
         this.worldX = param1.readShort();
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element of PaddockContentInformations.worldX.");
         }
         this.worldY = param1.readShort();
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element of PaddockContentInformations.worldY.");
         }
         this.mapId = param1.readInt();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new MountInformationsForPaddock();
            _loc4_.deserialize(param1);
            this.mountsInformations.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
