package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class btnGruop_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_chunyang:feathers.controls.SkinnableContainer;

		public var btn_jiuxiao:feathers.controls.SkinnableContainer;

		public var btn_longxiang:feathers.controls.SkinnableContainer;

		public var btn_mingxin:feathers.controls.SkinnableContainer;

		public var btn_qiankun:feathers.controls.SkinnableContainer;

		public var btn_shijue:feathers.controls.SkinnableContainer;

		public var btn_wanji:feathers.controls.SkinnableContainer;

		public var btn_xiaoyao:feathers.controls.SkinnableContainer;

		public var btn_xijing:feathers.controls.SkinnableContainer;

		public var btn_zhenyuan:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function btnGruop_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btn_longxiang_i(),btn_shijue_i(),btn_xiaoyao_i(),btn_qiankun_i(),btn_xijing_i(),btn_chunyang_i(),btn_zhenyuan_i(),btn_jiuxiao_i(),btn_mingxin_i(),btn_wanji_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_chunyang_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_chunyang = temp;
			temp.name = "btn_chunyang";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 355;
			return temp;
		}

		private function btn_jiuxiao_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_jiuxiao = temp;
			temp.name = "btn_jiuxiao";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 497;
			return temp;
		}

		private function btn_longxiang_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_longxiang = temp;
			temp.name = "btn_longxiang";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_mingxin_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_mingxin = temp;
			temp.name = "btn_mingxin";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 568;
			return temp;
		}

		private function btn_qiankun_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_qiankun = temp;
			temp.name = "btn_qiankun";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 213;
			return temp;
		}

		private function btn_shijue_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_shijue = temp;
			temp.name = "btn_shijue";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 71;
			return temp;
		}

		private function btn_wanji_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_wanji = temp;
			temp.name = "btn_wanji";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 639;
			return temp;
		}

		private function btn_xiaoyao_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_xiaoyao = temp;
			temp.name = "btn_xiaoyao";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 142;
			return temp;
		}

		private function btn_xijing_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_xijing = temp;
			temp.name = "btn_xijing";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 284;
			return temp;
		}

		private function btn_zhenyuan_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_zhenyuan = temp;
			temp.name = "btn_zhenyuan";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 426;
			return temp;
		}

	}
}