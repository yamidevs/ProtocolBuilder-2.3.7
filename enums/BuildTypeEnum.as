package com.ankamagames.dofus.network.enums
{
   [Trusted]
   public class BuildTypeEnum
   {
      
      public static const RELEASE:uint = 0;
      
      public static const BETA:uint = 1;
      
      public static const ALPHA:uint = 2;
      
      public static const INTERNALTEST:uint = 3;
      
      public static const NIGHTLYBUILD:uint = 4;
      
      public static const DEBUG:uint = 5;
       
      
      public function BuildTypeEnum()
      {
         super();
      }
   }
}
