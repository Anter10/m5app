// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) {
  return Market()
    ..id = json['id'] as int
    ..market_name = json['market_name'] as String
    ..tatal_unit_count = json['tatal_unit_count'] as int
    ..market_total_venture = (json['market_total_venture'] as num)?.toDouble()
    ..history_trade_total_lots =
        (json['history_trade_total_lots'] as num)?.toDouble()
    ..lots = (json['lots'] as num)?.toDouble()
    ..market_total_profit = (json['market_total_profit'] as num)?.toDouble()
    ..profit = (json['profit'] as num)?.toDouble()
    ..volume = (json['volume'] as num)?.toDouble()
    ..time_msc = (json['time_msc'] as num)?.toDouble()
    ..market_total_order_count = json['market_total_order_count'] as int
    ..statue = json['statue'] as int
    ..time = json['time'] as int
    ..flags = json['flags'] as int
    ..volume_real = (json['volume_real'] as num)?.toDouble()
    ..custome = json['custome'] as bool
    ..chart_mode = json['chart_mode'] as int
    ..select = json['select'] as int
    ..visible = json['visible'] as bool
    ..session_deals = json['session_deals'] as int
    ..session_sell_orders = json['session_sell_orders'] as int
    ..volumehigh = (json['volumehigh'] as num)?.toDouble()
    ..volumelow = (json['volumelow'] as num)?.toDouble()
    ..digits = json['digits'] as int
    ..spread = (json['spread'] as num)?.toDouble()
    ..spread_float = json['spread_float'] as bool
    ..ticks_bookdepth = json['ticks_bookdepth'] as int
    ..trade_calc_mode = json['trade_calc_mode'] as int
    ..trade_mode = json['trade_mode'] as int
    ..start_time = json['start_time'] as int
    ..expiration_time = json['expiration_time'] as int
    ..trade_stops_level = json['trade_stops_level'] as int
    ..trade_freeze_level = json['trade_freeze_level'] as int
    ..trade_exemode = json['trade_exemode'] as int
    ..swap_mode = json['swap_mode'] as int
    ..swap_rollover3days = json['swap_rollover3days'] as int
    ..margin_hedged_use_leg = json['margin_hedged_use_leg'] as bool
    ..expiration_mode = json['expiration_mode'] as int
    ..filling_mode = json['filling_mode'] as int
    ..order_mode = json['order_mode'] as int
    ..order_gtc_mode = json['order_gtc_mode'] as int
    ..option_mode = json['option_mode'] as int
    ..option_right = json['option_right'] as int
    ..bid = (json['bid'] as num)?.toDouble()
    ..bidhigh = (json['bidhigh'] as num)?.toDouble()
    ..bidlow = (json['bidlow'] as num)?.toDouble()
    ..ask = (json['ask'] as num)?.toDouble()
    ..askhigh = (json['askhigh'] as num)?.toDouble()
    ..asklow = (json['asklow'] as num)?.toDouble()
    ..last = (json['last'] as num)?.toDouble()
    ..lasthigh = (json['lasthigh'] as num)?.toDouble()
    ..lastlow = (json['lastlow'] as num)?.toDouble()
    ..volumehigh_real = (json['volumehigh_real'] as num)?.toDouble()
    ..option_strike = (json['option_strike'] as num)?.toDouble()
    ..point = (json['point'] as num)?.toDouble()
    ..trade_tick_value = (json['trade_tick_value'] as num)?.toDouble()
    ..trade_tick_value_profit =
        (json['trade_tick_value_profit'] as num)?.toDouble()
    ..trade_tick_value_loss = (json['trade_tick_value_loss'] as num)?.toDouble()
    ..trade_tick_size = (json['trade_tick_size'] as num)?.toDouble()
    ..trade_contract_size = (json['trade_contract_size'] as num)?.toDouble()
    ..trade_accrued_interest =
        (json['trade_accrued_interest'] as num)?.toDouble()
    ..trade_face_value = (json['trade_face_value'] as num)?.toDouble()
    ..trade_liquidity_rate = (json['trade_liquidity_rate'] as num)?.toDouble()
    ..volume_min = (json['volume_min'] as num)?.toDouble()
    ..volume_max = (json['volume_max'] as num)?.toDouble()
    ..volume_step = (json['volume_step'] as num)?.toDouble()
    ..volume_limit = (json['volume_limit'] as num)?.toDouble()
    ..swap_long = (json['swap_long'] as num)?.toDouble()
    ..swap_short = (json['swap_short'] as num)?.toDouble()
    ..margin_initial = (json['margin_initial'] as num)?.toDouble()
    ..margin_maintenance = (json['margin_maintenance'] as num)?.toDouble()
    ..session_volume = (json['session_volume'] as num)?.toDouble()
    ..session_turnover = (json['session_turnover'] as num)?.toDouble()
    ..session_interest = (json['session_interest'] as num)?.toDouble()
    ..session_buy_orders_volume =
        (json['session_buy_orders_volume'] as num)?.toDouble()
    ..session_sell_orders_volume =
        (json['session_sell_orders_volume'] as num)?.toDouble()
    ..session_open = (json['session_open'] as num)?.toDouble()
    ..session_close = (json['session_close'] as num)?.toDouble()
    ..session_aw = (json['session_aw'] as num)?.toDouble()
    ..session_price_settlement =
        (json['session_price_settlement'] as num)?.toDouble()
    ..session_price_limit_min =
        (json['session_price_limit_min'] as num)?.toDouble()
    ..session_price_limit_max =
        (json['session_price_limit_max'] as num)?.toDouble()
    ..margin_hedged = (json['margin_hedged'] as num)?.toDouble()
    ..price_change = (json['price_change'] as num)?.toDouble()
    ..price_volatility = (json['price_volatility'] as num)?.toDouble()
    ..price_theoretical = (json['price_theoretical'] as num)?.toDouble()
    ..price_greeks_delta = (json['price_greeks_delta'] as num)?.toDouble()
    ..price_greeks_theta = (json['price_greeks_theta'] as num)?.toDouble()
    ..price_greeks_gamma = (json['price_greeks_gamma'] as num)?.toDouble()
    ..price_greeks_vega = (json['price_greeks_vega'] as num)?.toDouble()
    ..price_greeks_rho = (json['price_greeks_rho'] as num)?.toDouble()
    ..price_greeks_omega = (json['price_greeks_omega'] as num)?.toDouble()
    ..price_sensitivity = (json['price_sensitivity'] as num)?.toDouble()
    ..basis = json['basis'] as String
    ..category = json['category'] as String
    ..currency_base = json['currency_base'] as String
    ..currency_profit = json['currency_profit'] as String
    ..currency_margin = json['currency_margin'] as String
    ..bank = json['bank'] as String
    ..description = json['description'] as String
    ..exchange = json['exchange'] as String
    ..formula = json['formula'] as String
    ..isin = json['isin'] as String
    ..name = json['name'] as String
    ..page = json['page'] as String
    ..path = json['path'] as String;
}

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'id': instance.id,
      'market_name': instance.market_name,
      'tatal_unit_count': instance.tatal_unit_count,
      'market_total_venture': instance.market_total_venture,
      'history_trade_total_lots': instance.history_trade_total_lots,
      'lots': instance.lots,
      'market_total_profit': instance.market_total_profit,
      'profit': instance.profit,
      'volume': instance.volume,
      'time_msc': instance.time_msc,
      'market_total_order_count': instance.market_total_order_count,
      'statue': instance.statue,
      'time': instance.time,
      'flags': instance.flags,
      'volume_real': instance.volume_real,
      'custome': instance.custome,
      'chart_mode': instance.chart_mode,
      'select': instance.select,
      'visible': instance.visible,
      'session_deals': instance.session_deals,
      'session_sell_orders': instance.session_sell_orders,
      'volumehigh': instance.volumehigh,
      'volumelow': instance.volumelow,
      'digits': instance.digits,
      'spread': instance.spread,
      'spread_float': instance.spread_float,
      'ticks_bookdepth': instance.ticks_bookdepth,
      'trade_calc_mode': instance.trade_calc_mode,
      'trade_mode': instance.trade_mode,
      'start_time': instance.start_time,
      'expiration_time': instance.expiration_time,
      'trade_stops_level': instance.trade_stops_level,
      'trade_freeze_level': instance.trade_freeze_level,
      'trade_exemode': instance.trade_exemode,
      'swap_mode': instance.swap_mode,
      'swap_rollover3days': instance.swap_rollover3days,
      'margin_hedged_use_leg': instance.margin_hedged_use_leg,
      'expiration_mode': instance.expiration_mode,
      'filling_mode': instance.filling_mode,
      'order_mode': instance.order_mode,
      'order_gtc_mode': instance.order_gtc_mode,
      'option_mode': instance.option_mode,
      'option_right': instance.option_right,
      'bid': instance.bid,
      'bidhigh': instance.bidhigh,
      'bidlow': instance.bidlow,
      'ask': instance.ask,
      'askhigh': instance.askhigh,
      'asklow': instance.asklow,
      'last': instance.last,
      'lasthigh': instance.lasthigh,
      'lastlow': instance.lastlow,
      'volumehigh_real': instance.volumehigh_real,
      'option_strike': instance.option_strike,
      'point': instance.point,
      'trade_tick_value': instance.trade_tick_value,
      'trade_tick_value_profit': instance.trade_tick_value_profit,
      'trade_tick_value_loss': instance.trade_tick_value_loss,
      'trade_tick_size': instance.trade_tick_size,
      'trade_contract_size': instance.trade_contract_size,
      'trade_accrued_interest': instance.trade_accrued_interest,
      'trade_face_value': instance.trade_face_value,
      'trade_liquidity_rate': instance.trade_liquidity_rate,
      'volume_min': instance.volume_min,
      'volume_max': instance.volume_max,
      'volume_step': instance.volume_step,
      'volume_limit': instance.volume_limit,
      'swap_long': instance.swap_long,
      'swap_short': instance.swap_short,
      'margin_initial': instance.margin_initial,
      'margin_maintenance': instance.margin_maintenance,
      'session_volume': instance.session_volume,
      'session_turnover': instance.session_turnover,
      'session_interest': instance.session_interest,
      'session_buy_orders_volume': instance.session_buy_orders_volume,
      'session_sell_orders_volume': instance.session_sell_orders_volume,
      'session_open': instance.session_open,
      'session_close': instance.session_close,
      'session_aw': instance.session_aw,
      'session_price_settlement': instance.session_price_settlement,
      'session_price_limit_min': instance.session_price_limit_min,
      'session_price_limit_max': instance.session_price_limit_max,
      'margin_hedged': instance.margin_hedged,
      'price_change': instance.price_change,
      'price_volatility': instance.price_volatility,
      'price_theoretical': instance.price_theoretical,
      'price_greeks_delta': instance.price_greeks_delta,
      'price_greeks_theta': instance.price_greeks_theta,
      'price_greeks_gamma': instance.price_greeks_gamma,
      'price_greeks_vega': instance.price_greeks_vega,
      'price_greeks_rho': instance.price_greeks_rho,
      'price_greeks_omega': instance.price_greeks_omega,
      'price_sensitivity': instance.price_sensitivity,
      'basis': instance.basis,
      'category': instance.category,
      'currency_base': instance.currency_base,
      'currency_profit': instance.currency_profit,
      'currency_margin': instance.currency_margin,
      'bank': instance.bank,
      'description': instance.description,
      'exchange': instance.exchange,
      'formula': instance.formula,
      'isin': instance.isin,
      'name': instance.name,
      'page': instance.page,
      'path': instance.path,
    };
