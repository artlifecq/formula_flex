package org.mokylin.skin.mainui.teamlist
{
	import feathers.controls.Group;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamHeadPortraitSkin extends feathers.controls.StateSkin
	{
		public var group:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamHeadPortraitSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 350;
			this.width = 250;
			this.elementsContent = [group_i()];
			
			states = {
			};
			skinNames={};
		}


		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 350;
			temp.width = 250;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}