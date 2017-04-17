package edu.gznc.cxcyzx.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisUtils {
	private static JedisPoolConfig jedisPoolConfig = null;
	private static JedisPool jedisPool = null;
	
	static{
		jedisPoolConfig = new JedisPoolConfig();
		jedisPoolConfig.setMaxTotal(30);
		jedisPoolConfig.setMaxIdle(8);
		jedisPool = new JedisPool(jedisPoolConfig,"192.168.121.128",6379);
	}
	
	public static Jedis getJedis(){
		return jedisPool.getResource();
	}
	
	public static void closeJedis(Jedis j){
		j.close();
	}
}
