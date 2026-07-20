import { createClient } from '@supabase/supabase-js';

const url = import.meta.env.VITE_SUPABASE_URL;
const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

/** null cuando no hay credenciales → la app corre en modo demo. */
export const supabase = url && anonKey ? createClient(url, anonKey) : null;

export const isDemoMode = supabase === null;
